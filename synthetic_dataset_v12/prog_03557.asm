; DESCRIPTION: Renders a magenta box of size 93x74 starting at (160, 82).
; PLAN: r0=160(x), r1=82(y), r2=93(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 82
LDI r2, 93
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
