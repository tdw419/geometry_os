; DESCRIPTION: Renders a red box of size 111x16 starting at (21, 117).
; PLAN: r0=21(x), r1=117(y), r2=111(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 117
LDI r2, 111
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
