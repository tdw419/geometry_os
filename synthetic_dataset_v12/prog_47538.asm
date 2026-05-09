; DESCRIPTION: Renders a cyan box of size 115x40 starting at (113, 178).
; PLAN: r0=113(x), r1=178(y), r2=115(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 178
LDI r2, 115
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
