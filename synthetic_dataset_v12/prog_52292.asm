; DESCRIPTION: Places a green 70x72 rectangle at position (143, 55).
; PLAN: r0=143(x), r1=55(y), r2=70(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 55
LDI r2, 70
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
