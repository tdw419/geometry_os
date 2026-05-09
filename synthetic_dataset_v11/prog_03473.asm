; DESCRIPTION: Places a white 70x55 rectangle at position (135, 75).
; PLAN: r0=135(x), r1=75(y), r2=70(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 75
LDI r2, 70
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
