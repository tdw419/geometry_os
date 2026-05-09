; DESCRIPTION: Renders a cyan box of size 16x117 starting at (216, 127).
; PLAN: r0=216(x), r1=127(y), r2=16(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 127
LDI r2, 16
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
