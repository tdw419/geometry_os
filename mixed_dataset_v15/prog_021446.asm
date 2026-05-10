; DESCRIPTION: Composite: Sets a single orange pixel at (455, 127) then Places a yellow 117x79 rectangle at position (196, 152).
; PLAN: r0=455(x), r1=127(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=152(y), r7=117(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 127
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 196
LDI r6, 152
LDI r7, 117
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
