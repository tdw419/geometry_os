; DESCRIPTION: Places a white 90x55 rectangle at position (288, 9).
; PLAN: r0=288(x), r1=9(y), r2=90(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 9
LDI r2, 90
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
