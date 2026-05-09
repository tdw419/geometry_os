; DESCRIPTION: Places a white 118x47 rectangle at position (38, 111).
; PLAN: r0=38(x), r1=111(y), r2=118(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 111
LDI r2, 118
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
