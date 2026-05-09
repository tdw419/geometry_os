; DESCRIPTION: Composite: Places a purple 55x103 rectangle at position (36, 95) then Places a magenta dot at position (404, 195).
; PLAN: r0=36(x), r1=95(y), r2=55(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=195(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 36
LDI r1, 95
LDI r2, 55
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 195
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
