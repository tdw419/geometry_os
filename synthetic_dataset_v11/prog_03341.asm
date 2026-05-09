; DESCRIPTION: Renders a cyan box of size 97x113 starting at (133, 115).
; PLAN: r0=133(x), r1=115(y), r2=97(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 115
LDI r2, 97
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
