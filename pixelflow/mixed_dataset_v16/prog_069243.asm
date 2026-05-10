; DESCRIPTION: Composite: Places a blue 120x85 rectangle at position (174, 79) then Places a orange dot at position (113, 249).
; PLAN: r0=174(x), r1=79(y), r2=120(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=249(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 174
LDI r1, 79
LDI r2, 120
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 249
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
