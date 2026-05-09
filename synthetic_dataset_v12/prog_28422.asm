; DESCRIPTION: Renders a red box of size 94x111 starting at (70, 23).
; PLAN: r0=70(x), r1=23(y), r2=94(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 23
LDI r2, 94
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
