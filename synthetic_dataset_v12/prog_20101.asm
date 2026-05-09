; DESCRIPTION: Places a orange 86x55 rectangle at position (154, 173).
; PLAN: r0=154(x), r1=173(y), r2=86(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 173
LDI r2, 86
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
