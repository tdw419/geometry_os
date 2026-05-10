; DESCRIPTION: Places a red 77x37 rectangle at position (403, 200).
; PLAN: r0=403(x), r1=200(y), r2=77(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 200
LDI r2, 77
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
