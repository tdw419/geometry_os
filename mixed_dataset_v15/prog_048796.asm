; DESCRIPTION: Renders a magenta box of size 68x74 starting at (308, 161).
; PLAN: r0=308(x), r1=161(y), r2=68(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 161
LDI r2, 68
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
