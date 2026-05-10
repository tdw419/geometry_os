; DESCRIPTION: Creates a orange filled rectangle of size 16x29 starting at (298, 162).
; PLAN: r0=298(x), r1=162(y), r2=16(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 162
LDI r2, 16
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
