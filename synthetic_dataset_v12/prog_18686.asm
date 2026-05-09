; DESCRIPTION: Renders a red box of size 67x79 starting at (410, 131).
; PLAN: r0=410(x), r1=131(y), r2=67(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 131
LDI r2, 67
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
