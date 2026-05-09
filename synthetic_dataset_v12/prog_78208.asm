; DESCRIPTION: Renders a red box of size 80x49 starting at (284, 70).
; PLAN: r0=284(x), r1=70(y), r2=80(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 70
LDI r2, 80
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
