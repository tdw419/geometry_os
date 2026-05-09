; DESCRIPTION: Renders a red box of size 52x45 starting at (146, 79).
; PLAN: r0=146(x), r1=79(y), r2=52(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 79
LDI r2, 52
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
