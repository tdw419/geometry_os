; DESCRIPTION: Places a orange 31x95 rectangle at position (398, 51).
; PLAN: r0=398(x), r1=51(y), r2=31(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 51
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
