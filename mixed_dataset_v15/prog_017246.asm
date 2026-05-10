; DESCRIPTION: Renders a magenta box of size 61x105 starting at (446, 38).
; PLAN: r0=446(x), r1=38(y), r2=61(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 38
LDI r2, 61
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
