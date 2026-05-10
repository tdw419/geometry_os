; DESCRIPTION: Renders a cyan box of size 101x81 starting at (392, 99).
; PLAN: r0=392(x), r1=99(y), r2=101(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 99
LDI r2, 101
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
