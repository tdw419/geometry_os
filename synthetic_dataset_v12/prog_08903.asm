; DESCRIPTION: Places a cyan 82x58 rectangle at position (275, 178).
; PLAN: r0=275(x), r1=178(y), r2=82(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 178
LDI r2, 82
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
