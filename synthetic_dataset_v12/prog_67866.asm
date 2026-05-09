; DESCRIPTION: Places a cyan 42x79 rectangle at position (290, 171).
; PLAN: r0=290(x), r1=171(y), r2=42(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 171
LDI r2, 42
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
