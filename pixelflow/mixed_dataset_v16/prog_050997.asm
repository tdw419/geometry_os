; DESCRIPTION: Renders a magenta box of size 36x33 starting at (403, 142).
; PLAN: r0=403(x), r1=142(y), r2=36(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 142
LDI r2, 36
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
