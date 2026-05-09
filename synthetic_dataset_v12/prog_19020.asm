; DESCRIPTION: Creates a red rectangular region at (284, 83) spanning 33 by 80 pixels.
; PLAN: r0=284(x), r1=83(y), r2=33(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 83
LDI r2, 33
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
