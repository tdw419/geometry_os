; DESCRIPTION: Renders a red box of size 86x65 starting at (366, 174).
; PLAN: r0=366(x), r1=174(y), r2=86(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 174
LDI r2, 86
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
