; DESCRIPTION: Places a orange 107x22 rectangle at position (398, 210).
; PLAN: r0=398(x), r1=210(y), r2=107(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 210
LDI r2, 107
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
