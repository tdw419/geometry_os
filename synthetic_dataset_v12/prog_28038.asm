; DESCRIPTION: Renders a red box of size 85x77 starting at (398, 162).
; PLAN: r0=398(x), r1=162(y), r2=85(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 162
LDI r2, 85
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
