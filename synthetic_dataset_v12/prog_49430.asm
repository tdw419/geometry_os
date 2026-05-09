; DESCRIPTION: Composite: Places a magenta dot at position (439, 238) then Places a magenta 50x103 rectangle at position (117, 143).
; PLAN: r0=439(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=143(y), r7=50(width), r8=103(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 143
LDI r7, 50
LDI r8, 103
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
