; DESCRIPTION: Creates a red rectangular region at (204, 221) spanning 45 by 33 pixels.
; PLAN: r0=204(x), r1=221(y), r2=45(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 221
LDI r2, 45
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
