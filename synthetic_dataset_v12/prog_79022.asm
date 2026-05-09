; DESCRIPTION: Places a white 82x110 rectangle at position (248, 55).
; PLAN: r0=248(x), r1=55(y), r2=82(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 55
LDI r2, 82
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
