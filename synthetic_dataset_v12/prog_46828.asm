; DESCRIPTION: Places a orange 91x16 rectangle at position (154, 55).
; PLAN: r0=154(x), r1=55(y), r2=91(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 55
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
