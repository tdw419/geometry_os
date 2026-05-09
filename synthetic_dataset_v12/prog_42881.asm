; DESCRIPTION: Renders a red box of size 67x98 starting at (146, 50).
; PLAN: r0=146(x), r1=50(y), r2=67(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 50
LDI r2, 67
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
