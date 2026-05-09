; DESCRIPTION: Renders a red box of size 59x27 starting at (152, 12).
; PLAN: r0=152(x), r1=12(y), r2=59(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 12
LDI r2, 59
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
