; DESCRIPTION: Places a white 50x79 rectangle at position (83, 55).
; PLAN: r0=83(x), r1=55(y), r2=50(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 55
LDI r2, 50
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
