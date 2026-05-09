; DESCRIPTION: Composite: Places a yellow 16x19 rectangle at position (168, 215) then Places a green dot at position (199, 39).
; PLAN: r0=168(x), r1=215(y), r2=16(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 215
LDI r2, 16
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
