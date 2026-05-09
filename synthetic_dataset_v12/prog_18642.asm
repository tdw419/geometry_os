; DESCRIPTION: Places a orange 18x42 rectangle at position (305, 143).
; PLAN: r0=305(x), r1=143(y), r2=18(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 143
LDI r2, 18
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
