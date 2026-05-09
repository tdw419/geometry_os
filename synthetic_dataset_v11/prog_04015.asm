; DESCRIPTION: Renders a red box of size 21x90 starting at (59, 117).
; PLAN: r0=59(x), r1=117(y), r2=21(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 117
LDI r2, 21
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
