; DESCRIPTION: Places a orange 44x92 rectangle at position (173, 1).
; PLAN: r0=173(x), r1=1(y), r2=44(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 1
LDI r2, 44
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
