; DESCRIPTION: Renders a red box of size 72x80 starting at (263, 168).
; PLAN: r0=263(x), r1=168(y), r2=72(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 168
LDI r2, 72
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
