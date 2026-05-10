; DESCRIPTION: Creates a orange filled rectangle of size 73x15 starting at (197, 162).
; PLAN: r0=197(x), r1=162(y), r2=73(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 162
LDI r2, 73
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
