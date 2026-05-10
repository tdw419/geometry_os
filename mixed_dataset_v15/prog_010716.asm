; DESCRIPTION: Composite: Places a white line segment connecting (130, 69) to (353, 133) then Places a magenta dot at position (82, 228).
; PLAN: r0=130(x1), r1=69(y1), r2=353(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=228(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 69
LDI r2, 353
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 228
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
