; DESCRIPTION: Places a orange 37x79 rectangle at position (42, 177).
; PLAN: r0=42(x), r1=177(y), r2=37(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 177
LDI r2, 37
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
