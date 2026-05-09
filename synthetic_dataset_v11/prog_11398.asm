; DESCRIPTION: Renders a red box of size 120x27 starting at (48, 188).
; PLAN: r0=48(x), r1=188(y), r2=120(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 188
LDI r2, 120
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
