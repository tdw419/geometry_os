; DESCRIPTION: Creates a cyan rectangular region at (297, 184) spanning 120 by 38 pixels.
; PLAN: r0=297(x), r1=184(y), r2=120(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 184
LDI r2, 120
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
