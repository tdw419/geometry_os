; DESCRIPTION: Renders a magenta box of size 70x74 starting at (152, 115).
; PLAN: r0=152(x), r1=115(y), r2=70(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 115
LDI r2, 70
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
