; DESCRIPTION: Places a orange 10x97 rectangle at position (242, 112).
; PLAN: r0=242(x), r1=112(y), r2=10(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 112
LDI r2, 10
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
