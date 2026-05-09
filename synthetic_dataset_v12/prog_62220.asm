; DESCRIPTION: Renders a cyan box of size 63x117 starting at (16, 46).
; PLAN: r0=16(x), r1=46(y), r2=63(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 46
LDI r2, 63
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
