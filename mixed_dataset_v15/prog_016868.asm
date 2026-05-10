; DESCRIPTION: Places a white 82x58 box at position (214, 65).
; PLAN: r0=214(x), r1=65(y), r2=82(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 65
LDI r2, 82
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
