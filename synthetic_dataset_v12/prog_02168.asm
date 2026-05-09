; DESCRIPTION: Places a orange 15x100 rectangle at position (398, 143).
; PLAN: r0=398(x), r1=143(y), r2=15(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 143
LDI r2, 15
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
