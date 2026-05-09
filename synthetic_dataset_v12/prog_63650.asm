; DESCRIPTION: Renders a magenta box of size 104x115 starting at (77, 7).
; PLAN: r0=77(x), r1=7(y), r2=104(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 7
LDI r2, 104
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
