; DESCRIPTION: Renders a magenta box of size 40x61 starting at (446, 152).
; PLAN: r0=446(x), r1=152(y), r2=40(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 152
LDI r2, 40
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
