; DESCRIPTION: Renders a red box of size 65x79 starting at (445, 166).
; PLAN: r0=445(x), r1=166(y), r2=65(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 166
LDI r2, 65
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
