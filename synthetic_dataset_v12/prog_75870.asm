; DESCRIPTION: Renders a red box of size 104x76 starting at (305, 0).
; PLAN: r0=305(x), r1=0(y), r2=104(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 0
LDI r2, 104
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
