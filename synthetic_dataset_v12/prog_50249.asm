; DESCRIPTION: Composite: Renders a magenta line between points (139, 204) and (346, 111) then Places a white 41x31 rectangle at position (171, 169).
; PLAN: r0=139(x1), r1=204(y1), r2=346(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=169(y), r7=41(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 204
LDI r2, 346
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 169
LDI r7, 41
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
